class PostCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id]) #PostImageモデルから画像のidを参照する
    comment = current_user.post_comments.new(post_comment_params)
    #上記、今ログインしているユーザーの新規コメントフォームを表示(ストロングパラメータで規制する)
    comment.post_image_id = post_image.id
    #上記、フォームで入力された内容はコメントされた投稿画像のIDを取得する
    comment.save
    redirect_to post_image_path(post_image)
  end
  
  def destroy
  PostComment.find(params[:id]).destroy
  redirect_to post_image_path(params[:post_image_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end