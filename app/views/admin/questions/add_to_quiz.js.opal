check_boxes = Element['.question-cbox:checked']

if check_boxes.length == 0
  alert "Please select atleast one question"
else
  qs = check_boxes.map{|it| "question_id[]=#{it.attr('data-question-id')}" }.join('&')
  `location`.JS['href'] = "/admin/quiz_question_selection?#{qs}"
end


