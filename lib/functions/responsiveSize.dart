double responsiveSize(double orientation ,double minSize, double maxSize){
  if(orientation >= maxSize){
    return maxSize;
  }else if(orientation <= minSize){
    return minSize;
  } else{
    return orientation;
  }
}