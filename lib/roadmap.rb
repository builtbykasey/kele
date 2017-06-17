module Roadmap
    def get_roadmap(roadmap_id)
        # example use 37
        response = self.class.get("/roadmaps/#{roadmap_id}", headers: { "authorization" => @user_auth_token })
        @roadmap = JSON.parse(response.body)
    end

    def get_checkpoint(checkpoint_id)
        # example use 2467
        response = self.class.get("/checkpoints/#{checkpoint_id}", headers: { "authorization" => @user_auth_token })
        @checkpoint = JSON.parse(response.body)
    end
end
