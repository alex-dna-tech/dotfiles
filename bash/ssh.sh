sshl() {
  ssh -fNT -L $1:127.0.0.1:$1 $2
}

sshr() {
  ssh -fNT -R $1:127.0.0.1:$1 $2
}
