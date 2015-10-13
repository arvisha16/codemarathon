class SectionsController < ApplicationController
  def update
    if section.update_attributes(section_params)
      redirect_to edit_structure_course_path(course), notice: "Course updated successfully"
    else
      redirect_to edit_structure_course_path(course), alert: "Failed to update course contents"
    end
  end

  def move_up
    section.move_up

    redirect_to edit_structure_course_path(course)
  end

  def move_down
    section.move_down

    redirect_to edit_structure_course_path(course)
  end

  protected

  def section
    @section ||= Section.find(params[:id])
  end

  def course
    section.course
  end

  def section_params
    params.require(:section).permit(:title)
  end
end
