module TopicsHelper

  def get_topic_desc(topic)
    if topic.action_type == "create"
        if topic.object_type == "Fichier"
            obj = Fichier.find(topic.object_id)
            return "Add the file #{obj.data_file_name.to_s}" 
        end
    elsif topic.action_type == "update"
      if topic.object_type == "Fichier"
          obj = Fichier.find(topic.object_id)
          return "Update the file #{obj.data_file_name.to_s}" 
       end
    end 
  end
 
end
