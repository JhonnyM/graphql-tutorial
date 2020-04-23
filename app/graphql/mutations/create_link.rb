module Mutations
    class CreateLink < BaseMutation
      # arguments passed to the `resolve` method
      argument :description, String, required: true
      argument :url, String, required: true
  
      # return type from the mutation
      #type Types::LinkType, null: false
      field :link, Types::LinkType, null: false
  
      def resolve(description: nil, url: nil)
        link = Link.create!(
          description: description,
          url: url,
          user: context[:current_user]
        )
        {link: link}
      end
    end
  end