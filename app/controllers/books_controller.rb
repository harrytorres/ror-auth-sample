class BooksController < ApplicationController
  load_and_authorize_resource
  
  # GET /books or /books.json
  def index
    @books = Book.all
    @book = Book.new
  end

  # GET /books/1 or /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books or /books.json
  def create
    @book = current_user.book.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: "Book was successfully created." }
      else
        format.turbo_stream { render turbo_stream: turbo_stream.replace(@book), partial: "books/form", locals: { book: @book } }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    redirect_to @book, notice: 'Book was successfully updated.'
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:public_uid]) #find_by(params[:public_uid])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:title, :author, :publication_year, :public_uid)
    end
end
