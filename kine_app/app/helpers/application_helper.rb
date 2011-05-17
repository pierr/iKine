module ApplicationHelper
  # Return a title on a per-page basis.
   def title
     base_title = "Kine App"
     if @mode.nil?
       base_title
     else
       "#{base_title} | #{@mode}"
     end
   end
end
