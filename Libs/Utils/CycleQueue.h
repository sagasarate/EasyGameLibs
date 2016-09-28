#pragma once

template < class T >
class CCycleQueue
{
protected:
	T *							m_pBuffer;
	UINT						m_BufferSize;
	volatile UINT				m_BufferHead;
	volatile UINT				m_BufferTail;
public:
	CCycleQueue()
	{
		m_pBuffer = NULL;
		m_BufferSize = 0;
		m_BufferHead = 0;
		m_BufferTail = 0;
	}
	~CCycleQueue()
	{
		Destory();
	}

	bool Create(UINT Size)
	{
		Destory();
		m_BufferSize = Size + 1;
		m_pBuffer = new T[m_BufferSize];
		return true;
	}
	void Destory()
	{
		m_BufferHead = 0;
		m_BufferTail = 0;
		m_BufferSize = 0;
		SAFE_DELETE_ARRAY(m_pBuffer);
	}
	void Clear()
	{
		m_BufferHead = 0;
		m_BufferTail = 0;
	}

	UINT GetBufferSize()
	{
		//Buffer�Ŀ�ʹ�ô�С�ȴ�����СС1����ֹ��βָ���ص�
		if (m_BufferSize)
			return m_BufferSize - 1;
		else
			return 0;
	}
	UINT GetUsedSize()
	{
		if (m_BufferTail >= m_BufferHead)
			return m_BufferTail - m_BufferHead;
		else
			return (m_BufferSize - m_BufferHead) + m_BufferTail;
	}
	UINT GetFreeSize()
	{
		if (m_BufferSize)
		{
			if (m_BufferTail >= m_BufferHead)
				return m_BufferSize - (m_BufferTail - m_BufferHead) - 1;
			else
				return m_BufferHead - m_BufferTail - 1;
		}
		else
		{
			return 0;
		}
	}

	bool PushBack(T * pValue)
	{
		if (GetUsedSize() < GetBufferSize())
		{
			if (pValue)
				m_pBuffer[m_BufferTail] = *pValue;
			if (m_BufferSize - m_BufferTail > 1)
				m_BufferTail++;
			else
				m_BufferTail = 0;			
			return true;
		}
		return false;
	}

	bool PopFront(T * pValue)
	{
		if (GetUsedSize())
		{
			if (pValue)
				*pValue = m_pBuffer[m_BufferHead];

			if (m_BufferSize - m_BufferHead > 1)
				m_BufferHead++;
			else
				m_BufferHead = 0;			
			return true;
		}
		return false;
	}
	T * GetUsedTop()
	{
		if (GetUsedSize())
			return m_pBuffer + m_BufferHead;
		else
			return NULL;
	}
	T * GetFreeTail()
	{
		if (GetUsedSize() < GetBufferSize())
			return m_pBuffer + m_BufferTail;
		else
			return NULL;
	}
};
