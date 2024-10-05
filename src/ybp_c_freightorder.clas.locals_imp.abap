CLASS lhc_yc_freightorder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR yc_freightorder RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR yc_freightorder RESULT result.

*    METHODS get_global_features FOR GLOBAL FEATURES
*      IMPORTING REQUEST requested_features FOR yc_freightorder RESULT result.
    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR yc_freightorder RESULT result.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR yc_freightorder RESULT result.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE yc_freightorder.

ENDCLASS.

CLASS lhc_yc_freightorder IMPLEMENTATION.

  METHOD get_instance_authorizations.

    DATA: update_requested TYPE abap_bool,
          update_grtanted  TYPE abap_bool.

    READ ENTITIES OF yc_freightorder IN LOCAL MODE
      ENTITY yc_freightorder
      FIELDS ( FrightorderNo ) WITH CORRESPONDING #( keys )
      RESULT DATA(studentadmitted)
      FAILED failed.

    CHECK studentadmitted IS NOT INITIAL.
    update_requested = COND #( WHEN requested_authorizations-%update = if_abap_behv=>mk-on OR
                                    requested_authorizations-%delete = if_abap_behv=>mk-on THEN
                                    abap_true ELSE abap_false ).

    LOOP AT studentadmitted ASSIGNING FIELD-SYMBOL(<lfs_studentadmitted>).
      IF <lfs_studentadmitted>-Currency = abap_false.
        IF update_requested = abap_true.
*            update_grtanted = is_update_allowed(  ).
          IF update_grtanted = abap_on.
            APPEND VALUE #(  %tky = <lfs_studentadmitted>-%tky ) TO failed-yc_freightorder.
            APPEND VALUE #( %tky = keys[ 1 ]-%tky
                            %msg = new_message_with_text(
                                severity = if_abap_behv_message=>severity-error
                                text = 'No Authorization to update status!!!'
                            )
            ) TO reported-yc_freightorder.
          ENDIF.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

*  METHOD get_global_features.
*  ENDMETHOD.

  METHOD get_global_authorizations.

*   Check if EDIT operation is triggered or not
    IF requested_authorizations-%update = if_abap_behv=>mk-on
    OR
        requested_authorizations-%create   = if_abap_behv=>mk-on
.

*     Check method IS_UPDATE_ALLOWED (Authorization simulation Check method)
*      IF is_update_allowed( ) = abap_true.

*       update result with EDIT Allowed
      result-%update = if_abap_behv=>auth-allowed.
      result-%create = if_abap_behv=>auth-allowed.
      result-%delete = if_abap_behv=>auth-allowed.

*      ELSE.

**       update result with EDIT Not Allowed
*        result-%update = if_abap_behv=>auth-unauthorized.
*        result-%action-Edit = if_abap_behv=>auth-unauthorized.
*
*      ENDIF.
    ENDIF.

  ENDMETHOD.

  METHOD get_global_features.

*   Check if EDIT operation is triggered or not
    IF requested_features-%create = if_abap_behv=>mk-on
.

*     Check method IS_UPDATE_ALLOWED (Authorization simulation Check method)
*      IF is_update_allowed( ) = abap_true.

*       update result with EDIT Allowed
      result-%create = if_abap_behv=>auth-allowed.

*      ELSE.

**       update result with EDIT Not Allowed
*        result-%update = if_abap_behv=>auth-unauthorized.
*        result-%action-Edit = if_abap_behv=>auth-unauthorized.
*
*      ENDIF.
    ENDIF.

  ENDMETHOD.

  METHOD precheck_update.
  ENDMETHOD.

ENDCLASS.
