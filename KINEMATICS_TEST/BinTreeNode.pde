public class BinTreeNode<T> {
  public T data;
  public BinTreeNode<T> left, right;
  public BinTreeNode(T data, BinTreeNode<T> left, BinTreeNode<T> right) {
      this.data = data;
      this.left = left;
      this.right = right;
  }
  public BinTreeNode(T data) {
    this.data = data;
  }
}
