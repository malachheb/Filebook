module TopicsHelper

  def get_topic_desc(topic)
    if topic.object_type == "Fichier"
      obj = Fichier.find(topic.object_id)
      if topic.action_type == "create"
        return "Add the file #{obj.data_file_name.to_s}" 
      elsif topic.action_type == "update"
        return "Update the file #{obj.data_file_name.to_s}" 
      end
    end 
  end
 
end
