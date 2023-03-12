# frozen_string_literal: true

module ProjectsHelper
  def star_icon(project) # rubocop:disable Metrics/MethodLength
    starred = project.starred_members.find { _1 == current_user }
    color = starred ? "text-yellow-500" : ""
    fill = starred ? "currentColor" : "none"
    testid = starred ? "star" : "nostar"
    method = starred ? :delete : :put

    # rubocop:disable Layout/LineLength
    form_with url: starred_projects_path, method: do |f|
      concat(f.hidden_field(:project_code, value: project.code))
      concat(
        content_tag(:button, type: "submit", "aria-label": "star") do
          content_tag(:span, class: color, data: { testid: }) do
            content_tag :svg, xmlns: "http://www.w3.org/2000/svg", fill:, viewBox: "0 0 24 24",
                              "stroke-width": "1.5", stroke: "currentColor", class: "w-6 h-6" do
              content_tag :path, nil, "stroke-linecap": "round", "stroke-linejoin": "round",
                                      d: "M11.48 3.499a.562.562 0 011.04 0l2.125 5.111a.563.563 0 00.475.345l5.518.442c.499.04.701.663.321.988l-4.204 3.602a.563.563 0 00-.182.557l1.285 5.385a.562.562 0 01-.84.61l-4.725-2.885a.563.563 0 00-.586 0L6.982 20.54a.562.562 0 01-.84-.61l1.285-5.386a.562.562 0 00-.182-.557l-4.204-3.602a.563.563 0 01.321-.988l5.518-.442a.563.563 0 00.475-.345L11.48 3.5z"
            end
          end
        end
      )
    end
    # rubocop:enable Layout/LineLength
  end
end
