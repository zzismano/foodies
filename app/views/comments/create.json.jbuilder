if @comment.commentable_type == "Meal"
  if @comment.persisted?
    json.form render(partial: "shared/comment_form", formats: :html, locals: {comment: Comment.new, meal: @meal})
    json.inserted_item render(partial: "shared/comment", formats: :html, locals: {comment: @comment})
  else
    json.form render(partial: "shared/comment_form", formats: :html, locals: {comment: @comment, meal: @meal})
  end
else
  if @comment.persisted?
    json.form render(partial: "shared/comment_form", formats: :html, locals: {comment: Comment.new, meal: @recipe})
    json.inserted_item render(partial: "shared/comment", formats: :html, locals: {comment: @comment} )
  else
    json.form render(partial: "shared/comment_form", formats: :html, locals: {comment: @comment, meal: @recipe})
  end
end
