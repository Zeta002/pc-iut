/**
 *
 * @File : nsSysteme.cxx
 *
 * 2011
 * @Synopsis : definition des wrappers non inline des fonctions syst
 *
**/

#include <string>
#include <fcntl.h>       // O_CREAT, open()
#include <sys/types.h>   // mode_t, ssize_t
#include <unistd.h> // read, write
#include <cstddef>       // size_t
#include "../Include/CException.hpp"
#include "../Include/nsSysteme.h"

using namespace std;     // string
using namespace nsUtil;     // CException

void nsSysteme::Stat (const char * file_name, struct stat * buf) // throw (CExc)
{
    if (::stat (file_name, buf))
        throw CException ("stat() " + std::string("fichier :")+ file_name);

} // Stat()

int nsSysteme::Open (const char * pathname, int flags){
    int fd;
    if (-1 == (fd = ::open (pathname, flags)))
        throw CException ("open() " + std::string("fichier :")+ pathname);
    return fd;
}//Open ()

int nsSysteme::Open   (const char * pathname, int flags, ::mode_t mode){
    int fd;
    if (-1 == (fd = ::open (pathname, flags, mode)))
        throw CException ("open() " + std::string("fichier :")+ pathname);
    return fd;
}//Open ()

void nsSysteme::Fstat (int fd, struct stat * buf){
    if (::fstat (fd, buf))
        throw CException ("fstat() " + std::string("sur file descriptor fichier :")+ to_string (fd));

} // Fstat()

void nsSysteme::Close  (int fd){
    if (::close (fd))
        throw CException (string("close() sur file descriptor fichier :")+ to_string (fd));
}//Close ()


ssize_t nsSysteme::Read   (int fd, void * buf, size_t count){
    ssize_t nbOctets;
    if (-1 == (nbOctets = ::read (fd, buf, count)))
        throw CException (string("read() sur file descriptor fichier :")+ to_string (fd));
    return nbOctets;
}//Read ()
ssize_t nsSysteme::Write(int fd, const void *buf, size_t count){
    ssize_t nbOctets;
    if (-1 == (nbOctets = ::write (fd, buf, count)))
        throw CException (string("write() sur file descriptor fichier :")+ to_string (fd));
    return nbOctets;
}//write ()
