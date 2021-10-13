from fastapi import FastAPI, Response, status

app = FastAPI()

@app.get("/")
async def root():
    return {"msg": "This is the App Backend!"}


"""
    add_friend implements the /new-friend route

    resp: Response
        The response to send back to the user which contains the status code and body

    uuid: str
        The UUID of the user who is adding the new friend

    fuuid: str
        The UUID of the friend to be added

    returns Response
        Response.body: dict
            Provides any msgs/errs for the request
        Response.status: int
            The status code for the request
"""
@app.get("/new-friend/", status_code=status.HTTP_201_CREATED)
async def add_friend(resp: Response, uuid: str = None, fuuid: str = None):
    # check if the uuid exists
    if uuid is None or not isinstance(uuid, str) or uuid == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err": "Invalid UUID"}
    if fuuid is None or not isinstance(fuuid, str) or fuuid == "":
        resp.status_code = status.HTTP_400_BAD_REQUEST
        return {"err" : "Invalid Friend UUID"}

    # check if the uuid does not already contain fuuid
    if uuid == fuuid:
        resp.status_code = status.HTTP_406_NOT_ACCEPTABLE
        return {"err" : "Invalid combination of UUIDs"}

    uuid_friends = ["test_uuid"]  # TODO: get uuid's friends here
    if fuuid in uuid_friends:
        resp.status_code = status.HTTP_412_PRECONDITION_FAILED
        return {"err" : "FUUID already linked to UUID"}

    # add fuuid
    uuid_friends.append(fuuid)
    return {"msg" : "FUUID has been successfully linked to UUID"} 
