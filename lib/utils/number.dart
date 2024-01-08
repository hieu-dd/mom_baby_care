extension NumberExt on num {
  num negativeToZero() {
    return this < 0 ? 0 : this;
  }
}
