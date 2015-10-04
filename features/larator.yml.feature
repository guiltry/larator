Feature: Run command with options from .larator.yml

  Scenario: run command with controller_location
    When I write to ".larator.yml" with:
    """
    controller_location: "app/Http/TestControllers"
    """
    And I run `larator generate scaffold user`
    Then the file "app/Http/TestControllers/UserController.php" should exist

  Scenario: run command with controller_namespace
    When I write to ".larator.yml" with:
    """
    controller_namespace: "App\\Http\\TestControllers"
    """
    And I run `larator generate scaffold user`
    Then the file "app/Http/Controllers/UserController.php" should contain:
    """
    namespace App\Http\TestControllers;
    """

  Scenario: run command with model_location
    When I write to ".larator.yml" with:
    """
    model_location: "app/Models"
    """
    And I run `larator generate scaffold user`
    Then the file "app/Models/User.php" should exist

  Scenario: run command with model_namespace
    When I write to ".larator.yml" with:
    """
    model_namespace: "App\\Models"
    """
    And I run `larator generate scaffold user`
    Then the file "app/User.php" should contain:
    """
    namespace App\Models;
    """

  Scenario: run command with view_location
    When I write to ".larator.yml" with:
    """
    view_location: "views"
    """
    And I run `larator generate scaffold user`
    Then the file "views/users/index.blade.php" should exist
    And the file "views/users/create.blade.php" should exist
    And the file "views/users/show.blade.php" should exist
    And the file "views/users/edit.blade.php" should exist
    And the file "views/users/_form.blade.php" should exist
