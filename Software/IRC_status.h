#ifndef IRC_STATUS_H
#define IRC_STATUS_H

// Note: IRC_SUCCESS is 0 and IRC_FAILURE is 1 for compatibility with XStatus (XST_SUCCESS and XST_FAILURE)

/**
 * IRCam status
 */
enum IRC_Status {
   IRC_SUCCESS = 0,  /**< The process is successful */
   IRC_FAILURE = 1,  /**< The process failed */
   IRC_DONE,         /**< The process is done */
   IRC_NOT_DONE      /**< The process is not done */
};

/**
 * IRCam status data type
 */
typedef enum IRC_Status IRC_Status_t;

#endif // IRC_STATUS_H
