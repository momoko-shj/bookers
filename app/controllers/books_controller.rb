class BooksController < ApplicationController
  def new
    
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
    flash[:hoge]="Book was successfully created."
  end
  
  def show
   @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
    flash[:hoge]="Book was successfully updated."
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
    flash[:hoge]="Book was successfully destroyed."
  end
  
  
private

    def book_params
    params.require(:book).permit(:title, :body)
    end
 end
