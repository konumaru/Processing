void addElement(int num) {
  if (array_size >= ARRAY_MAX) {
    println("Heap overflow.");
    return;
  }
  array[array_size + 1] = num;
  array_size++;
  step();

  // Now the time to fix the order of the heap.
  int i = array_size; // let's start from the latest element.
  while (i > 1) {
    int p = i / 2; // parent element
    // Then compare array[p] with array[i], and swap them if needed.
    // When they are swapped, continue this loop. Don't forget to update
    // the value of i.
    // If they are not swapped, just break this loop.
    if (array[p] != array[i]) { //!!! <- correct this expression
      //step();
      break; // Remove this line.
    } else {
      break;
    }
  }
}

void removeElement() {
  if (array_size == 0) {
    println("Heap underflow.");
    return;
  }
  array[1] = array[array_size];
  array_size--;
  step();

  // Now the time to fix the order of the heap.
}
