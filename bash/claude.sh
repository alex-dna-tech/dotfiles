_claude_with_or() {
  local model="${1:-openrouter/free}"
  local base_url="${2:-https://openrouter.ai/api}"
  local auth_token="${3:-$OPENROUTER_API_KEY}"
  shift 3
  ANTHROPIC_BASE_URL="$base_url" \
  ANTHROPIC_AUTH_TOKEN="$auth_token" \
  ANTHROPIC_API_KEY="" \
  ANTHROPIC_MODEL="$model" \
  ANTHROPIC_DEFAULT_SONNET_MODEL="$model" \
  ANTHROPIC_DEFAULT_OPUS_MODEL="$model" \
  ANTHROPIC_DEFAULT_HAIKU_MODEL="$model"  \
  ANTHROPIC_SMALL_FAST_MODEL="$model" \
  CLAUDE_CODE_SUBAGENT_MODEL="$model" \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  claude --dangerously-skip-permissions "$@"
}

_claude_with_gemini() {
  local model_main="${1:-gemini-3-flash}"
  local base_url="${2:-http://127.0.0.1:8317}"
  local auth_token="${3:-$GEMINI_API_KEY}"
  local model_fast="${4:-gemini-lite}"
  local model_lite="${5:-gemini-lite}"
  local model_strong="${6:-gemma-4-31b-it}"
  shift 6
  ANTHROPIC_BASE_URL="$base_url" \
  ANTHROPIC_AUTH_TOKEN="$auth_token" \
  ANTHROPIC_API_KEY="" \
  ANTHROPIC_MODEL="$model_main" \
  ANTHROPIC_DEFAULT_SONNET_MODEL="$model_strong" \
  ANTHROPIC_DEFAULT_OPUS_MODEL="$model_strong" \
  ANTHROPIC_DEFAULT_HAIKU_MODEL="$modeli_lite"  \
  ANTHROPIC_SMALL_FAST_MODEL="$model_lite" \
  CLAUDE_CODE_SUBAGENT_MODEL="$model_strong" \
  CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1 \
  claude --dangerously-skip-permissions "$@"
}

alias ccc='_claude_with_or'
alias cccgh='_claude_with_or "gh-gpt-4o" "http://127.0.0.1:8317" $GEMINI_API_KEY'
alias ccg='_claude_with_gemini'
alias ccg31='_claude_with_gemini "gemma-4-31b"'
alias ccg26='_claude_with_gemini "gemma-4-26b"'
alias ccg3f='_claude_with_gemini "gemini-3-flash"'
alias ccg3l='_claude_with_gemini "gemini-3-lite"'
alias ccofh='_claude_with_or "tencent/hy3-preview:free"'
alias ccofm='_claude_with_or "minimax/minimax-m2.5:free"'
alias ccoc='_claude_with_or "$OPENAI_MODEL" "$OPENAI_BASE_URL" "$OPENROUTER_API_KEY"'
alias ccaa='_claude_with_or "llama-3.3-70b" "$MICRO_AI_BASE_URL" "$MICRO_AI_API_KEY"'

