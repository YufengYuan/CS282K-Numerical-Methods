function error = mse(imgRec, imgOri)
  [h, w] = size(imgRec);
  error = sum(sum((imgRec - imgOri).^2/(h*w)));
end