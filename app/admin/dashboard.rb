ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "This is a panel" do
        end
      end
    end
    columns do

      column do
        panel "Recent Posts" do
          ul do
            Post.last(5).map do |p|
              li link_to("#{p.id} - #{post_title p}", p)
            end
          end
        end
      end

      column do
        panel "New Blog Post" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Sizes" do
          para "Most Popular Sizes"
          ul do
            Post.all.group_by{|p| p.size}.map do |size, pairs|
              li link_to "#{size.name} - #{pairs.size}", root_path 
            end
          end
        end
      end
    end
  end # content
end
