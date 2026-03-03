<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Pet Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" />
    <link rel="stylesheet" href="styles/styles.css">
</head>
<body>

<section class="h-100 gradient-form" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <div class="text-center">
                                    <img src="images/paw.png" style="width: 120px;" alt="PetMate Paw Logo">
                                    <h4 class="mt-1 mb-5 pb-1">PetMate - Add Pet</h4>
                                </div>

                                <form method="post" action="insertpet.jsp">
                                    <p>Enter new pet details</p>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="name" name="name" class="form-control" required minlength="2" maxlength="50" />
                                        <label class="form-label" for="name">Pet Name</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="breed" name="breed" class="form-control" required />
                                        <label class="form-label" for="breed">Breed</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="number" id="age" name="age" class="form-control" required min="0" max="50" />
                                        <label class="form-label" for="age">Age</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <select class="form-select" name="gender" required>
                                            <option value="" disabled selected>Select Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                        <label class="form-label" for="gender">Gender</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <textarea name="description" class="form-control" required rows="3"></textarea>
                                        <label class="form-label" for="description">Description</label>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <input type="text" id="image" name="image" class="form-control" required />
                                        <label class="form-label" for="image">Image URL</label>
                                    </div>

                                    <div class="text-center pt-1 mb-5 pb-1">
                                        <button class="btn btn-success btn-block fa-lg mb-3" type="submit">Add Pet</button>
                                    </div>
                                </form>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                <h4 class="mb-4">Every pet deserves a loving home.</h4>
                                <p class="small mb-0">Add a pet to the adoption system with accurate details. PetMate will help you connect animals to their forever families efficiently.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- JS & MDB -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        mdb.Input.init();
    });
</script>

</body>
</html>
