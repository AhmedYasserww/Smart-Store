String formatSize(String size) {
  switch (size.toLowerCase()) {
    case 'small':
      return 'S';
    case 'medium':
      return 'M';
    case 'large':
      return 'L';
    case 'xl':
    case '2xl':
    case '3xl':
    case '4xl':
    case '5xl':
      return size.toUpperCase();
    default:
      return size;
  }
}