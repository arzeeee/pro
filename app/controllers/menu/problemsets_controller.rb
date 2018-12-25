class Menu::ProblemsetsController < Menu::BaseMenuController
  
  def index
    @subjects = Subject.all
  end
  
  def show
    @chapters = Lesson.joins(:subject)
                      .where("subjectName like ?", "%#{params[:subject]}%")
                      .where("lessonType like ?", "ProblemSet")
                      .pluck_to_hash(:chapter,:lessonName)
  end
  
end