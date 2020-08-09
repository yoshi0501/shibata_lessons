class GroupController < ApplicationController
    before_action :set_group,only:[:edit,:update]
    def index
    end

    def new
        @group = Group.new
        #部分テンプレート_group_form.html.haml内で使用するタミー変数
        #group#newがリクエストされた場合は、空の配列を渡すことでcurrent_userが二重で表示されるのを防ぐ
        @users = []
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to root_path, notice: 'グループを作成しました'
        else
            render:new
        end
    end
