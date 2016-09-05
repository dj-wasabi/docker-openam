
def test_socker(Socket):
    assert Socket('tcp://0.0.0.0:8080').is_listening


def test_user_details(User):
    my_user = User("openam")
    assert my_user.uid == 1001
    assert my_user.home == '/home/openam'


def test_bootstrap(File):
    bootstrap = File("/openam/bootstrap")
    assert bootstrap.user == "openam"
    assert bootstrap.group == "openam"
    assert bootstrap.mode == 0o400
