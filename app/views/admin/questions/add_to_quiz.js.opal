check_boxes = Element['.question-cbox:checked']
if check_boxes.length == 0
  alert "Please select atleast one question"
end
puts check_boxes


