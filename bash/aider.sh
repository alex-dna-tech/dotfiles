aider-docs() {
  if [ $# -eq 0 ]; then
    echo "Usage: $(basename "$0") <URL> [URL...]"
    echo
    echo "Generate aider 'convention' Markdown context from documentation URLs."
    echo "suitable for providing LLM context about a project's conventions and style."
    echo
    echo "Outputs a file in the current directory named like 'technology-name.md'."
    exit 1
  fi
  aider --detect-urls --no-git --no-auto-commits --yes --message "Please summarize the documentation at the following URL into a concise form suitable for giving an LLM context about a project. Write the summary as Markdown into a .md file with a relevant short kebab-case name like 'technology-name.md'. Where appropriate make sure you include a suite of relevant code examples to help the LLM write code in the suggested style of the project. The result will be concatenated with summaries of other technologies so it should have a clear h1 header indicating the content of this markdown section/file. $*"
}

aider-base() {
    aider \
      --vim \
      --pretty \
      --stream \
      --notifications \
      --dark-mode \
      --no-show-model-warnings \
      --edit-format diff \
      "$@"
}

aider-free() {
    local models="default
gpt-4
gpt-4o
o1
o1-mini
o3-mini
o3-mini-high
o4-mini
gpt-4.1
gpt-4.1-mini
gpt-4.1-nano
deepseek-v3
deepseek-r1
qwen-2-72b
qwen-2.5-72b
qwen-2.5-coder-32b
qwen-3-235b
qwen-3-32b
qwen-3-30b
qwen-325b-a22b
gemini-1.5-flash
gemini-1.5-pro
gemini-2.0-flash
gemini-2.5-flash
gemini-2.5-pro
gemma-2-27b
gemma-3-12b
gemma-3-27b
grok-3
mistral-small-3.1-24b
claude-3-7-sonnet
phi-4"

    local selected_model=$(echo "$models" | sort -u | fzf --prompt="Select a model: ")
    if [[ -n "$selected_model" ]]; then
      aider-base \
        --openai-api-key "sk-Free" \
        --openai-api-base "http://localhost:1337/v1" \
        --model "openai/$selected_model" \
        --weak-model "openai/gpt-4o-mini" \
        --no-detect-urls \
        --no-auto-commit \
        --no-auto-lint \
        "$@"
    fi
}

aider-dev-gemini-flash() {
  aider-base \
    --watch-files \
    --cache-prompts \
    --no-stream \
    --model "gemini/gemini-3-flash" \
    --weak-model "gemini/gemini-2.5-flash-lite" \
    --no-detect-urls \
    --no-auto-commit \
    --no-auto-lint \
    "$@"
}

aider-dev-gemini() {
  aider-base \
    --watch-files \
    --cache-prompts \
    --no-stream \
    --model "gemini/gemini-2.5-pro" \
    --weak-model "gemini/gemini-2.0-flash" \
    --no-detect-urls \
    --no-auto-commit \
    --no-auto-lint \
    "$@"
}


aider-dev-arch() {
  aider-base \
    --architect \
    --watch-files \
    --model "gemini/gemini-3-flash" \
    --editor-model "gemini/gemini-2.0-flash" \
    --weak-model "gemini/gemini-2.5-flash-lite" \
    --no-detect-urls \
    --no-auto-commit \
    --no-auto-lint \
    "$@"
}

aider-ollama() {
    local selected_model=$(ollama list | awk 'NR>1 {print $1}' | fzf --prompt="Select a model: ")

    [[ -n "$selected_model" ]] && \
        aider-base \
            --model "ollama_chat/$selected_model" \
            "$@"
}

