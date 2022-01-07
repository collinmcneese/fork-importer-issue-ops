# frozen_string_literal: true

module CircleCI
  class DryRun
    include IssueParser

    def initialize(issue_content, command)
      # TODO: manually test this
      @organization = parameter_from_issue("Organization", issue_content)
      @project = command.options["project"]
    end

    def to_a
      args = []
      args.concat(["--circle-ci-organization", @organization]) unless @organization.nil?
      args.concat(["--circle-ci-project", @project]) unless @project.nil?

      return args unless args.empty?
    end
  end
end
