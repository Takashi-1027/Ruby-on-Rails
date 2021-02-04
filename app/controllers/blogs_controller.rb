class BlogsController < ApplicationController
    def index
      @blogs = Blog.all
    end

    def show
      @blog = Blog.find(params[:id])
    end

    def new
      @blog = Blog.new
    end

    def create
      blog = Blog.new(blog_params)
      blog.save
      redirect_to blogs_path(blog.id)
    end

    def edit
      @blog = Blog.find(params[:id])
    end

    def update
      blog = Blog.find(params[:id]) # 投稿データを取得する
      blog.update(blog_params)
      redirect_to blog_path(blog)
    end

    # 削除機能を実装
    def destroy # destroyアクションを追加する
      blog = Blog.find(params[:id]) # 投稿データを取得する
      blog.destroy # 投稿データを削除する
      redirect_to blogs_path # 投稿の一覧ページへリダイレクトする
    end

    private
      def blog_params
        params.require(:blog).permit(:title, :category, :body)
      end
end
