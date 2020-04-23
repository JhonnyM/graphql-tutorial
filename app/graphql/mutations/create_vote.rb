module Mutations
    class CreateVote < BaseMutation
      argument :link_id, ID, required: false
  
      #type Types::VoteType
      field :vote, Types::VoteType, null: false
  
      def resolve(link_id: nil)
        vote = Vote.create!(
          link: Link.find(link_id),
          user: context[:current_user]
        )
        {vote: vote}
      end
    end
  end