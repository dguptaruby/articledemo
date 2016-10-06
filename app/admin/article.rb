ActiveAdmin.register Article do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

  

  permit_params :title, :body
form do |f|
  f.semantic_errors
  f.inputs do
    f.input :title, as: :string
    f.input :body, :as => :text, placeholder: "Enter url to generate snippet"
  end
  f.actions do 
  	f.action :submit, :as => :button
  	f.action :reset, :as => :button
  end 
end

action_item only: %i(new edit) do
  link_to 'Create Snippet', 'javascript:void(0)',  id: :'test'
end

action_item  do
  link_to 'Show all snippet', displays_path
end

collection_action :get_html_snippet, method: :post do
	require 'oembed'
	 OEmbed::Providers.register_all
	 begin
	 	resource = OEmbed::Providers.get(params["body_val"])
	 rescue
	 	redirect_to new_admin_article_path
	 end
  
  unless resource.nil?
	  resource.video? #=> true
	  resource.thumbnail_url #=> "http://i3.ytimg.com/vi/2BYXBC8WQ5k/hqdefault.jpg"
	  if resource.provider_name == "Instagram"
	    resource.html.gsub!('"//platform.instagram.com/en_US/embeds.js"','"http://platform.instagram.com/en_US/embeds.js"')
	  else
	  	resource.html
	  end
	  respond_to do |format|
	    format.json { render(json: resource, status: 200) }
	  end
  end
end

end
