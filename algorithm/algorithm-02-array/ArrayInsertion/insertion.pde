// The following function is the core of this program.
// Call "step()" to refresh the screen and wait for key input.
// WARNING: the following code is completly WRONG.
// You are expected to find and fix the issue.
void insertion() {
  step(0);
  for (int i = 0; i < a.length - 1; i++) { //<>//
    a[i+1] = a[i];
    step(i);
  }
}