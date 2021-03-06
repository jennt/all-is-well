class EntriesController < ApplicationController
  def entries_index
    @entries = Post.where(client_id: current_user.userable_id).order(created_at: :desc)
  end

  def create
    @entry = Post.new(title: params[:post][:title], body: params[:post][:body], sharable: params[:togglePrivacy])
    @entry.client_id = current_user.userable_id
    if @entry.save!
      redirect_to entries_index_path
    end
  end

  private

  def entry_params
    params.permit(:client_id, :sharable, :read, :title, :body)
  end
end
