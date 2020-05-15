class TimetableController < ApplicationController
  def index
    @arr = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    if logged_in?
      @timetable = Array.new(6)
      (1...6).each do |th|
        @timetable[th] = []
        @arr.each do |str|
          query = "SELECT classid FROM classtables WHERE key = ? AND th = ? AND day = ?"
          tp = Classtable.find_by_sql([query, @current_user.id, th, str])
          if tp.empty?
            @timetable[th] << ""
          else 
            @timetable[th] << Classinfo.find(tp[0].classid)
          end
        end
      end
    else
      @timetable = []
    end
  end

  def edit
    @arr = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    if logged_in?
      @timetable = Array.new(6)
      (0..5).each do |th|
        @timetable[th] = []
        @arr.each do |str|
          query = "SELECT classid FROM classtables WHERE key = ? AND th = ? AND day = ?"
          tp = Classtable.find_by_sql([query, @current_user.id, th+1, str])
          if tp.empty?
            @timetable[th] << ""
          else 
            @timetable[th] << Classinfo.find(tp[0].classid)
          end
        end
      end
    else
      @timetable = []
    end
  end

  def form 
    @state = -1
    if logged_in?
      query = "SELECT id classid FROM classtables WHERE key = ? AND th = ? AND day = ?"
      @tp = Classtable.find_by_sql([query, current_user.id, params[:th], params[:day]])

      if !@tp.empty?
        @classinfo = Classinfo.find(@tp[0].classid)
        @state = 1
        if request.patch? then
          @classinfo.update classinfo_params

          redirect_to '/timetable/edit'
        end
      else
        @classinfo = Classinfo.new
        @state = 0
      end
    else
      redirect_to '/timetable'
    end
  end

  def createClassinfo
    @classinfo = Classinfo.new(classinfo_params)
    if @classinfo.save
      classinfo = Classinfo.find_by(url: @classinfo.url)
      @classtable = Classtable.new(classid: classinfo.id, key: current_user.id, day: classinfo.day, th: classinfo.th)
      if @classtable.save
        redirect_to '/timetable/edit'
      else
        render 'form'
      end

    else
      render 'form'
    end
  end

#  def createClasstable
#    @classtable = Classtable.new(classtable_params)
#    if @classtable.save
#      redirect_to '/timetable/edit'
#    else
#      render '/timetable/edit/:day/:th'
#    end
#  end

  def delete
  end

  def classinfo_params
    params.require(:classinfo).permit(:day, :th, :url, :classname)
  end

  def classtable_params
    params.require(:classtable).permit(:key, :day, :th, :classid)
  end
end