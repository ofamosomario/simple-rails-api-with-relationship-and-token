module V1
  class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_relationships, only: [:show, :update, :destroy]

    # POST /relationships
    def create
      @relationship = Relationship.new(
          follower_id: current_user.id,
          followed_id: params[:followed_id],
          status: Relationship.statuses[:pending]
      )

      @user_followed = User.find(params[:followed_id])

      if !Relationship.already_following? current_user.id , params[:followed_id]
        if @relationship.save
          render_json_confirmation I18n.t(:new_following, scope: [:generics, :confirms] , user_followed: @user_followed.name) , :ok
        else
          render json: @relationship.errors, status: :unprocessable_entity
        end
      else
        if Relationship.is_status_pending? current_user.id , params[:followed_id] , Relationship.statuses[:pending]
          render_json_confirmation I18n.t(:status_pending, scope: [:generics, :errors]) , :ok
        else
          render_json_confirmation I18n.t(:already_friends, scope: [:generics, :errors]) , :ok
        end
      end
    end

    # DELETE /relationships/1
    def destroy
      @relationship.destroy
    end

    # LIST-FOLLOWERS /relationship/list-followers
    def list_followers
      @followers = User.list_followers current_user.id
      render json: @followers
    end

    # ACCEPT /relationship/accept
    def accept
      accept_or_reject params[:followed_id], Relationship.statuses[:accepted]
    end

    # ACCEPT /relationship/reject
    def reject
      accept_or_reject params[:followed_id], Relationship.statuses[:rejected]
    end

    def accept_or_reject followed_id , status
      if !User.have_relationship? current_user.id , params[:followed_id]
        render_json_confirmation I18n.t(:not_friends, scope: [:generics, :errors]) , :ok
      else
        if status == Relationship.statuses[:accepted]
          Relationship.accept_friendship current_user.id , followed_id
          render_json_confirmation I18n.t(:accepted_friend, scope: [:generics, :confirms]) , :ok
        elsif status == Relationship.statuses[:rejected]
          Relationship.reject_friendship current_user.id , followed_id
          render_json_confirmation I18n.t(:rejected_friend, scope: [:generics, :confirms]) , :ok
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_relationships
        @relationships = Relationships.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def relationships_params
        params.require(:relationship).permit(:follower_id, :followed_id)
      end
  end
end
