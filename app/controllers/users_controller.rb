class UsersController < MainController
  def index
    @title = "Bleh"
    @users = User.all
    response_with
  end
end
