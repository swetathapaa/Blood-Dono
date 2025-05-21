package com.blooddono.util;

import com.blooddono.model.User;
import com.blooddono.model.DonorModel;

public class UserToDonorMapper {
    public static DonorModel map(User user) {
        return new DonorModel(
            user.getFirstName(),
            user.getLastName(),
            user.getBloodGroup(),
            user.getDob(),
            user.getGender(),
            user.getEmail(),
            user.getContact(),
            user.getPassword(),
            user.getProfilePic()
        );
    }
} 