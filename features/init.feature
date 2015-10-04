Feature: Generate larator config file

  Scenario: run init command
    When I run `larator init`
    Then the file ".larator.yml" should exist
    And the file ".larator.yml" should contain:
    """
    # controller_location: "app/Http/Controllers"
    # controller_namespace: "App\\Http\\Controllers"

    # model_location: "app/"
    # model_namespace: "App"

    # view_location: "resources/views/"
    """
