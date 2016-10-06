class DisplaysController < InheritedResources::Base
  def index
  	@displays = Article.all
  end
  def show
  	@display = Article.find(params[:id])
  end
  private

    def display_params
      params.require(:display).permit(:title, :body)
    end
end

