<div class="modal fade" id="modal_access" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered mw-650px">
        <div class="modal-content">
            <div class="modal-header" id="modal_accessHeader">
                <h2 class="fw-bold">Password Authentication Entry</h2>
                <div class="btn btn-icon btn-sm btn-active-icon-primary" data-bs-dismiss="modal">
                    <i class="ki-duotone ki-cross fs-1"><span class="path1"></span><span class="path2"></span></i>
                </div>
            </div>
            <div class="modal-body px-5 my-7">
                <div>
                    <div class="d-flex flex-column scroll-y px-5 px-lg-10" id="modal_access" data-kt-scroll="true" data-kt-scroll-activate="true" data-kt-scroll-max-height="auto" data-kt-scroll-dependencies="#modal_hrPasswordAccessHeaderDelete" data-kt-scroll-wrappers="#modal_hrPasswordAccess" data-kt-scroll-offset="300px">
                        <div class="fv-row mb-0" hidden>
                            <label class="fw-semibold fs-6 mb-2">Access</label>
                            <div class="input-group mb-5">
                                <span class="input-group-text">
                                    <i class="ki-duotone ki-check-circle text-primary fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                </span>
                                <input type="text" class="form-control" id="ii_accesspassword" placeholder="Access Password" readonly />
                            </div>
                        </div>
                        <div class="fv-row mb-0" hidden>
                            <label class="fw-semibold fs-6 mb-2">Confirmation</label>
                            <div class="input-group mb-5">
                                <span class="input-group-text">
                                    <i class="ki-duotone ki-check-circle text-primary fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                </span>
                                <input type="text" class="form-control" id="ii_accessconfirmation" placeholder="Access Confirmation" readonly />
                            </div>
                        </div>
                        <div class="fv-row mb-0">
                            <label class="fw-semibold fs-6 mb-2">Password</label>
                            <div class="input-group mb-5">
                                <span class="input-group-text">
                                    <i class="ki-duotone ki-check-circle text-primary fs-3">
                                        <span class="path1"></span>
                                        <span class="path2"></span>
                                    </i>
                                </span>
                                <input type="password" class="form-control" id="ii_password" placeholder="Password" aria-label="Password" aria-describedby="ii_password" />
                            </div>
                        </div>
                    </div>
                    <div class="text-center pt-10">
                        <button type="reset" class="btn btn-light me-3" data-bs-dismiss="modal">
                            Discard
                        </button>
                        <button type="submit" class="btn btn-primary" data-ii-userpassword-modal-action="submit">
                            <span class="indicator-label">
                                Submit
                            </span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>