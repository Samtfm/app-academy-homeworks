def quick_sort(arr)
  if arr.length <= 1
    arr
  else
    pivot = arr[0]
    left = arr[1..-1].select { |ele| ele < pivot }
    right = arr[1..-1].select { |ele| ele >= pivot }
    quick_sort(left) + [pivot] + quick_sort(right)
  end
end


puts quick_sort([1,4,5,2,2,5,8,-3,4,7].shuffle).to_s
