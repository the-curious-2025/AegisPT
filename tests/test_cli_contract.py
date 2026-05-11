from pentest_orchestrator import cli


def test_cli_parser_accepts_known_profiles() -> None:
    parser = cli._build_parser()
    args = parser.parse_args(["run", "--target", "127.0.0.1", "--authorized", "--profile", "web"])
    assert args.command == "run"
    assert args.profile == "web"


def test_cli_parser_rejects_invalid_profile() -> None:
    parser = cli._build_parser()
    try:
        parser.parse_args(["run", "--target", "127.0.0.1", "--authorized", "--profile", "invalid"])
        raise AssertionError("Parser should reject invalid profile")
    except SystemExit:
        assert True
