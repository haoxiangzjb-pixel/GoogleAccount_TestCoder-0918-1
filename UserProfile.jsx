import React from 'react';

const UserProfile = ({ user }) => {
  const { firstName, lastName, email, phone, avatar, bio, location } = user;

  return (
    <div className="user-profile">
      <div className="profile-header">
        {avatar ? (
          <img 
            src={avatar} 
            alt={`Avatar of ${firstName} ${lastName}`}
            className="avatar"
          />
        ) : (
          <div className="default-avatar">
            {firstName.charAt(0)}{lastName.charAt(0)}
          </div>
        )}
        <div className="user-info">
          <h1>{firstName} {lastName}</h1>
          <p className="user-title">{bio || 'User Profile'}</p>
        </div>
      </div>
      
      <div className="profile-details">
        <div className="detail-item">
          <strong>Email:</strong>
          <span>{email}</span>
        </div>
        <div className="detail-item">
          <strong>Phone:</strong>
          <span>{phone}</span>
        </div>
        {location && (
          <div className="detail-item">
            <strong>Location:</strong>
            <span>{location}</span>
          </div>
        )}
      </div>
    </div>
  );
};

export default UserProfile;