require "rails_helper"

RSpec.describe BooksController, type: :controller do
  let(:user) { instance_double(User) }

  before { log_in(user) }

  describe 'GET #index' do
    let(:books) do
      [ instance_double(Book), instance_double(Book) ]
    end

    before do
      allow(user).to receive(:books).and_return(books)

      get :index
    end

    it "looks up all books that belong to the current user" do
      expect(assigns(:books)).to eq(books)
    end
  end
end