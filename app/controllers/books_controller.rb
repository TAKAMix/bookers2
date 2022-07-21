class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  
  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    book = Book.new(book_params)
    book.user_id = current_user.id

    # 3. データをデータベースに保存するためのsaveメソッド実行
    book.save
    
    redirect_to books_path
  end

  def show
    @user = User.find(params[:id])
    
  end
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
