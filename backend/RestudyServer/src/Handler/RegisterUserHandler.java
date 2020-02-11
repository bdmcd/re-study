package Handler;

import Request.RegisterUserRequest;
import Result.RegisterUserResult;
import Service.RegisterUserService;

public class RegisterUserHandler {
    public RegisterUserResult HandleRequest(RegisterUserRequest request) {
        return RegisterUserService.processRequest(request);
    }
}
