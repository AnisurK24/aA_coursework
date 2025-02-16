// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
        this.value = val;
        this.next = null;
    }

}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
        this.head = null;
        this.tail = null;
        this.length = 0;
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
        let newNode = new Node(val);

        if (!this.head) {
          this.head = newNode;
        } else {
          this.tail.next = newNode;
        }

        this.tail = newNode;
        this.length++;
        return this;
    }

    // TODO: Implement the removeTail method here
    removeTail() {
        if (!this.head) return undefined;

        let current = this.head;
        let newTail = current;

        while (current.next) {
          newTail = current;
          current = current.next;
        }

        this.tail = newTail;
        this.tail.next = null;

        this.length--;

        if (this.length === 0) {
          this.head = null;
          this.tail = null;
        }

        return current;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {
        let newNode = new Node(val);

        this.head ? (newNode.next = this.head) : (this.tail = newNode);

        this.head = newNode;

        this.length++;
        return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
        if (!this.head) return undefined;

        let current = this.head;

        this.head = current.next;

        this.length--;

        if (this.length === 0) {
          this.head = null;
          this.tail = null;
        }

        return current;
    }

    // TODO: Implement the contains method here
    contains(target) {
        let current = this.head;

        while (current) {
          if (current.value === target) return true;
          current = current.next;
        }

        return false;
    }

    // TODO: Implement the get method here
    get(index) {
        let length = this.length;
        if (index < 0 || index >= length) return null;

        let node = this.head;
        for (let i = 0; i < index; i++) {
          node = node.next;
        }

        return node;
    }

    // TODO: Implement the set method here
    set(index, val) {
        let node = this.get(index);

        if (node) {
          node.value = val;
          return true;
        }

        return false;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
        let node = this.get(index);

        if (!node) return false;

        if (index === this.length) {
          return !!this.addToTail(val);
        } else if (index === 0) {
          return !!this.addToHead(val);
        } else {
          let newNode = new Node(val);

          let beforeNode = this.get(index - 1);
          beforeNode.next = newNode;
          newNode.next = node;
        }

        this.length++;
        return true;
    }

    // TODO: Implement the remove method here
    remove(index) {
        let node = this.get(index);
        if (!node) return undefined;

        if (index === this.length) {
          return !!this.removeTail();
        } else if (index === 0) {
          return !!this.removeHead();
        } else {
          let prevNode = this.get(index - 1);
          let nextNode = this.get(index + 1);

          prevNode.next = nextNode;
          this.length--;
        }
        return node;
    }

    // TODO: Implement the size method here
    size() {
        return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
