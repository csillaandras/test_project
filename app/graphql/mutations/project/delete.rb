module Mutations
  class Project::Delete < BaseMutation
    graphql_name 'DeleteProject'

    field :project, Types::ProjectType, null: true
    field :result, Boolean, null: true

    argument :id, ID, required: true

    def resolve(**args)
      project = ::Project.find(args[:id])
      project.destroy
      {
        project: project,
        result: project.errors.blank?
      }
    end
  end
end
