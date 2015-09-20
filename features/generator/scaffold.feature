Feature: Generate scaffold
  
  Scenario: run command without parameter
    Given an empty file named "app/Http/routes.php"
    When I run `larator generate scaffold user`
    
    # Controller
    Then the file "app/Http/Controllers/UserController.php" should exist
    And the file "app/Http/Controllers/UserController.php" should contain:
    """
    class UserController extends Controller
    """

    # View
    And the file "resources/views/users/index.blade.php" should exist
    And the file "resources/views/users/index.blade.php" should contain:
    """
    @foreach($users as $user)
    """
    And the file "resources/views/users/create.blade.php" should exist
    And the file "resources/views/users/create.blade.php" should contain:
    """
    @include('users._form')
    """
    And the file "resources/views/users/show.blade.php" should exist
    And the file "resources/views/users/show.blade.php" should contain:
    """
    {{$user->id}}
    """
    And the file "resources/views/users/edit.blade.php" should exist
    And the file "resources/views/users/edit.blade.php" should contain:
    """
    @include('users._form')
    """
    And the file "resources/views/users/_form.blade.php" should exist

    # Request
    And the file "app/Http/Requests/UserRequest.php" should exist
    And the file "app/Http/Requests/UserRequest.php" should contain:
    """
    class UserRequest extends Request
    """

    # Model
    And the file "app/User.php" should exist
    And the file "app/User.php" should contain:
    """
    class User extends Model
    """

    # Route
    And the file "app/Http/routes.php" should exist
    And the file "app/Http/routes.php" should contain:
    """
    Route::resource('user', 'UserController');
    """

    # Factory
    And the file "database/factories/UserFactory.php" should exist
    And the file "database/factories/UserFactory.php" should contain:
    """
    $factory->define(App\User::class, function (Faker\Generator $faker) {
    """

    # PHP Unit
    And the file "tests/UserTest.php" should exist
    And the file "tests/UserTest.php" should contain:
    """
    class UserTest extends TestCase
    """