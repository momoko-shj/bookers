class BooksController < ApplicationController
  def new
    
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def create
    book = Book.new(book_params)#新規でデータを取得する　createは内部処理のため@は不要
    book.save
    redirect_to book_path(book.id)#route.rbのパスで確認　idは自動生成される番号
  end
  
  def show
   @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  
private

    def book_params
    params.require(:book).permit(:title, :body)#カラムに入れるデータを定義づけ
    end
 
 end 