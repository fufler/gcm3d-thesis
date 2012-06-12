#!/usr/bin/Rscript --vanilla
mygrid <- function(xl,yl)
{
		for (x in xl)
					segments(x, yl[1], x, tail(yl, 1), lty="dotted",
					col="lightgrey");
						for (y in yl)
									segments(xl[1], y, tail(xl, 1), y,
									lty="dotted", col="lightgrey");
}

postscript(file="eps/gcm3d-boost.eps",
           paper="special",
           width=10,
           height=10,
           horizontal=FALSE)
procs <- c(1, 2, 3, 4, 6, 8, 12, 24)
times1 <- c(22, 11+7/60, 7+32/60, 5+45/60, 3+55/60, 2+57/60, 2+0/60, 1+2/60)
times2 <- c(21+37/60, 11+52/60, 9+19/60, 7+38/60, 5+51/60, 4+55/60, 4+0/60, 3+07/60)
boost1 <- times1[1]/times1
boost2 <- times2[1]/times2
plot(procs, procs, type="l",  lwd=3, lty=2, col="red", axes=F, ann=F)
lines(procs, boost1,  lwd=3, type="o")
lines(procs, boost2,  lwd=3, type="o", lty=2)
axis(2, las=1, at=seq(1,24))
axis(1, las=1, at=procs)
mygrid(procs, seq(1,24))
title("Зависимость производительности от числа процессоров", xlab="Число процессоров", 
ylab="Рост производительности в X раз")
legend(1, 24, c("Сквозной счёт", "Явное выделение контакта"), lty=1:2,
lwd=c(3,3), pch=c(1,1), text.width=6)
box()
dev.off()

postscript(file="eps/gcm3d-efficiency.eps",
           paper="special",
           width=10,
           height=10,
           horizontal=FALSE)
eff1 <- boost1/procs
eff2 <- boost2/procs
print(eff1)
print(eff2)
plot(procs, eff1, type="o", col="black", ylim=c(0.2, 1.0), lwd=3, axes=F, ann=F)
lines(procs, eff2, type="o", col="black", lwd=3, lty=2)
mygrid(procs, seq(0.2, 1.0, 0.1))
axis(2, las=1, at=seq(0.2, 1.0, by=0.1))
axis(1, las=1, at=procs)
title("Эффективность параллельного кода", 
xlab="Число процессоров", ylab="Эффективность")
legend(1, 0.5, c("Сквозной счёт", "Явное выделение контакта"), lty=1:2,
lwd=c(3,3), pch=c(1,1), text.width=6)
box()
dev.off()
